Topic - LPG gas detection using Arduino and Esp32 modules

Working
  - First let us see the prototype of our project
    
  - ![WhatsApp Image 2024-03-05 at 14 49 37_3fa96f89](https://github.com/ps7355/LPG-Detection-App/assets/103554138/bb5a32b3-273e-48f9-983d-a8ff86830bdc)
    
  - This is our prototype, we are using butane gas from fire lighter, which is also a form of LPG gas, we will release the butane gas near the MQ-6 sensor, the sensor will detect the gas and send the signal to the arduino and now the aurdino will trigger the buzzer alarm

  - Now the arduino with help of esp32 wifi module it will send the data collected from the sensor to the backend, we are using firebase as our backend

![Animation - 1709655960990](https://github.com/ps7355/LPG-Detection-App/assets/103554138/b3b8d791-e574-452f-af2b-0d4cda515d75)

- After the data has been sent sucessfully, the firebase will initiate a call to the user, it is a recorded voice

![WhatsApp Image 2024-03-05 at 22 02 54_7982717d](https://github.com/ps7355/LPG-Detection-App/assets/103554138/99a34528-daab-4411-8387-21aa4d1d9119)

- It will also send sms and an notification to the user

   ![WhatsApp Image 2024-03-05 at 22 02 53_55e68140](https://github.com/ps7355/LPG-Detection-App/assets/103554138/17b94202-da12-4375-8201-ea71e2da8535)

  ![WhatsApp Image 2024-03-05 at 22 08 31_fdbdec1a](https://github.com/ps7355/LPG-Detection-App/assets/103554138/8babe0ce-b6bf-476f-8e6a-5d7fbe1b3c59)

- If you click on that notification it will directly take you to our mobile app

  ![WhatsApp Image 2024-03-05 at 16 32 41_a3927371](https://github.com/ps7355/LPG-Detection-App/assets/103554138/08b067c1-296e-4645-8dfc-239060f7a17f)

- Now lets see what are the features available in our app, we have an emergency number tab, if you click it it will show you Ambulance and firestation phone no, you can directly make the call from the app
- 
![WhatsApp Image 2024-03-05 at 16 32 41_bc99f02e](https://github.com/ps7355/LPG-Detection-App/assets/103554138/a8536c26-3456-49ee-8d05-a8caef5b90fa)

- We, have an SOS button, incase in any emergency if you are not able to make call, if you click the SOS button, it will send your location to the emergency department and it will start making an emergency buzzer sound
- 
![WhatsApp Image 2024-03-05 at 16 32 40_4d61ad64](https://github.com/ps7355/LPG-Detection-App/assets/103554138/49f9d14f-0fe7-49e6-baac-02b50361ff72)

- You can see the longitude and latitude of our location has been sent to the emergency department

- You can also see the graph level of the sensor data, that has been collected during the gas leakage
  
![WhatsApp Image 2024-03-05 at 16 32 41_13409d75](https://github.com/ps7355/LPG-Detection-App/assets/103554138/c07be397-f463-4401-9f92-ac991e99fcad)

- You can also check the history of gas leakage in the history section




