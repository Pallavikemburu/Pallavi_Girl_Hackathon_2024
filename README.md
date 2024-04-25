
                 PALLAVI_KEMBURU_GIRL HACKATHTHON_2024  
  
     
  
  PROBLEM STATEMENT : 
      Adaptive Learning for Basic Education: Develop a virtual tutor platform that assesses the learner's understanding level at every step and curates relevant content to enhance the learning experience.   
     

                
      
  SOLUTION : The solution includes the   
      
    1. Assessment System:
     - Implement an initial assessment system that evaluates the learner's current understanding level in various basic education subjects such as mathematics, language arts, science, and social studies.
     - Use a combination of multiple-choice questions, short answers, and interactive tasks to gauge the learner's strengths and weaknesses.
  
    2. Data Analysis:
     - Utilize machine learning algorithms to analyze the assessment results and identify the learner's areas of proficiency and areas that need improvement.
     - Develop a personalized learning profile for each learner based on their assessment data, learning preferences, and goals.
  
    3. Curated Content:
     - Create a repository of educational content including lessons, quizzes, interactive simulations, videos, and games covering the basic education curriculum.
     - Tag each content item with metadata indicating its difficulty level, learning objectives, and relevance to specific topics or skills.
  
    4. Adaptive Learning Engine:
     - Build an adaptive learning engine that dynamically selects and presents content to the learner based on their current proficiency level and learning pace.
     - Utilize algorithms that adjust the difficulty of questions and activities based on the learner's performance, providing challenges without overwhelming or underwhelming them.   
     
      
   
   
 AI TECHNIQUES / SERVICES : 

    We used the AI models indirectly from API services, because its very hard to get the large data set related to eduaction field. 
    To get the API services we shouls have an API key and I used OpenAi.
    In our App I used API services for 
     - automatic content generation ( The content is very simple and easy to understand ,related examples also given in that content)
     - Generation of questions with options  ( To check our understanding level , we have to rake the test. And the questions and options with correct answer will be generated which are relevant to the displayed content )
     - Analysis of the correct answer  ( Comparing our answer with the Actual answer)
     - Recommending the relevant or advanced topics ( Based on the score, the topics will be recommended)
         
    In place of these services we can also use Models like GPT model,NLP techniques,Deep Learning Models etc.
   

   
         
 WHY GOOGLE FLUTTER :
 
    Flutter is a popular open-source UI software development kit created by Google. Here are some key features of Flutter:
   
     1. Single Codebase: Flutter allows developers to write code once and deploy it across multiple platforms like Android, iOS, web, and desktop, saving time and effort.
     
     2. Expressive UI: Flutter offers a rich set of customizable widgets that enable developers to build beautiful and highly responsive user interfaces.
     
     3. Hot Reload: One of Flutter's standout features is its hot reload functionality, which allows developers to instantly see changes made to the code reflected in the app's UI during development, speeding up the debugging and iteration process.
     
     4. Performance: Flutter apps are known for their high performance and smooth animations, thanks to its use of the Dart programming language and its own rendering engine.
     
     5. Native Performance: Flutter leverages platform-specific features and compiles to native code, providing near-native performance on both Android and iOS devices.
     
     6. Rich Motion APIs: Flutter provides rich motion APIs and pre-built animation widgets, making it easy for developers to create engaging animations and transitions in their apps.
     
     7. Access to Native Features: Developers can easily access platform-specific APIs and services using plugins, allowing them to integrate device features like camera, location, sensors, and more into their Flutter apps.
     
     8. Cross-platform Development: Flutter's cross-platform capabilities enable developers to reach a wider audience with a single codebase, reducing development time and maintenance costs.
     
     9. Community and Ecosystem: Flutter has a large and active community, providing developers with resources, libraries, and plugins to enhance their app development experience.
     
     10. Material Design and Cupertino Widgets: Flutter offers both Material Design widgets for Android apps and Cupertino widgets for iOS apps, ensuring a native look and feel on each platform.
     
     These features collectively make Flutter a powerful and versatile framework for building mobile, web, and desktop applications with a focus on performance, productivity, and aesthetics.


     

 WHY NODEJS :

      we are using the API key for API services.In Google Flutter, there is no backend scripting, and if you use the API from the frontend it will be insecure. So we are using Nodejs backend to store the API key and to utilize the services.
      
      Node.js is a runtime environment that allows developers to run JavaScript code outside of a web browser, typically on servers. Here are some key features of Node.js:
      
         1. Asynchronous and Event-Driven: Node.js uses an event-driven, non-blocking I/O model, which makes it lightweight and efficient for handling concurrent operations. This allows Node.js to handle multiple requests simultaneously without blocking other operations.
         
         2. JavaScript Runtime: Node.js is built on the V8 JavaScript engine, which is developed by Google and is known for its speed and performance. This allows developers to write server-side code in JavaScript, making it easier to switch between client-side and server-side development.
         
         3. NPM (Node Package Manager): Node.js comes with npm, a package manager that allows developers to easily install, manage, and share third-party libraries and modules. npm hosts a vast ecosystem of open-source packages that extend Node.js functionality and provide solutions for various tasks.
         
         4. Single-Threaded Event Loop: Node.js uses a single-threaded event loop architecture to handle asynchronous operations. This event loop efficiently manages I/O operations by delegating them to the system's kernel or background workers, freeing up the main thread to handle other tasks.
         
         5. Cross-Platform: Node.js is cross-platform and runs on various operating systems such as Windows, macOS, and Linux, providing flexibility and portability for developers.
         
         6. Scalability: Node.js is well-suited for building scalable applications due to its non-blocking I/O model and lightweight architecture. Developers can easily scale Node.js applications horizontally by adding more instances or vertically by optimizing code performance.
         
         7. Server-Side Development: Node.js is commonly used for server-side development, enabling developers to build web servers, APIs (Application Programming Interfaces), real-time applications (e.g., chat apps, gaming apps), streaming services, and more.
         
         8. Community and Ecosystem: Node.js has a large and active community of developers, contributing to its vibrant ecosystem of modules, frameworks (e.g., Express.js, Koa.js), tools, and resources. This ecosystem provides developers with a wide range of options and support for building diverse applications.
         
         9. Microservices Architecture: Node.js is often used in microservices architectures due to its lightweight nature, scalability, and ability to handle concurrent requests efficiently. It allows developers to build and deploy independent, loosely coupled services that communicate via APIs.
         
         10. Real-Time Communication: Node.js, combined with libraries like Socket.io, enables real-time communication between clients and servers through WebSockets and other protocols, making it suitable for building interactive and responsive applications.
      

            
    
  SETUP OF LOCAL ENVIRONMENT : 
  
  1. clone this repo
  2. to run this frontend and backend you need nodejs & flutter SDK in your system
  3. open this repo using vscode then you will get two folders
  	like this 
  		Backend
  		Frontend
  4. open terminal in vscode 
  	 cd Backend
  5. then run this commands
     npm i --legacy-peer-deps
  	 npm start
  6. open frontend to this path
  	 path--frontend/lib/utils/consts/app_urls.dart
  	 change the ip address in the urls with your system ip address
  7. Go to your frontend folder
  	 flutter pub get
  	 flutter run
  	 then select your emulator
  8. And now the App runs in Emulator.   
  
       
       
  versions :  
      node - 20.11.1  
      npm  - 10.2.4  
      sdk - '>=3.3.1 <4.0.0'  
  localhost : 5010  
    



  APK version :   https://drive.google.com/file/d/1CGKc0U2BfI7qY7i4VdhN7b2U0XiZ1I5C/view?usp=drivesdk   

       
  Login Details: As the time is not sufficient, I created a static login page  
       Username : girl  
       Password : 1234   

  

Demo Videos:   
 
   App Demo:    https://drive.google.com/file/d/1ClONx-CoFJ8jfJr28pEAygeeupjhe242/view?usp=drivesdk   
    
   Frontend and Backend Demo :   https://drive.google.com/file/d/1CybNT3o6YUgvUtsOdO6pPEkvbdcON-QS/view?usp=drivesdk

  

    
