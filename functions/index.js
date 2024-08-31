const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendNotificationOnMessage = functions.firestore
.document('chat_rooms/{chatRoomId}/messages/{messageId}')
.onCreate(async (snapshot, context) => {
    const message = snapshot.data();

    try {
        const receiverDoc = await admin.firestore().collection('users').doc(message.receiverId).get();
        if (!receiverDoc.exists) {
            console.log('No such document!');
            return null;
        }
        const receiverData = receiverDoc.data();
        const token = receiverData.fcmtoken;
        if (!token) {
            console.log('No token for user');
            return null;
        }
        // update the message w-playload for 'send' method
        const messagePayload = {
            token: token,
            notification: {
                title: 'New Message',
                body: '${message.senderEmail} says: ${message.message}'
               
            },
            android: {
                notification: {
                    clickAction: 'FLUTTER_NOTIFICATION_CLICK',
                }
            },
            apns: {
                payload: {
                    aps: {
                        category: 'FLUTTER_NOTIFICATION_CLICK',
                    },
                },
            },
           
        };
        // SEND THE MESSAGE
        const response = await admin.messaging().send(messagePayload);
        console.log('Successfully sent message:', response);
        return response;
    } catch (error) {
        console.error('Detailed error :', error);
        if (error.code && error.message) {
            console.error('Error code:', error.code);
            console.error('Error message:', error.message);
        }
        throw new Error('An error occurred while sending the message:', error); 

    }
});
