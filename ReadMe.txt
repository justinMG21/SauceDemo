1. Install Python in your machine and add it to your path
2. Run the following on cmd
    pip install virtualenv
        - On command prompt go to virtual env "cd {virtual environment path}"
        - Once inside the virtual environment run the following command
        - Add VirtualEnv/Scripts to path (Environmental Variables)
    activate
    pip install robotframework
    pip install robotframework-seleniumlibrary
    pip install --upgrade robotframework-datadriver
    pip install --upgrade robotframework-datadriver[XLS]
3. Install pycharm
4. Open project using pycharm
5. Run the project
    To run the project the easiest way is to run in in the terminal
    a. On the pycharm terminal make sure you are inside this directory "C:\Users\justin.guma\Desktop\SauceDemo\SwagLabs>"
    b. You can run both test suite by typing "robot -d Results SwagLabs/LoginValidations.robot SwagLabs/SwagLabsUsers.robot"
    c. Or you can run them separately by typing "robot -d Results SwagLabs/SwagLabsUsers.robot"
    d. Or you can run them separately by typing "robot -d Results SwagLabs/LoginValidations.robot"
    e. The report will be saved on the results folder

Notes:
    I have create 2 test suite. One for the LoginValidations.robot and the SwagLabsUser.robot
    The LoginValidations.robot is fetching the data from an excel sheet. In order for this to work you need to make sure data driver is installed properly
    The SwagLabsUser.robot contains all the test cases for the SwagLabs website. Their are 3 users (standard_user, problem_user and performance_glitch_user).
    All of the 3 users are utilizing the same test cases from Login Page, Homepage, Product Feature Page, Shopping Cart Page and the Global Header.
    So instead of create duplicate test cases I just used a data driven approach that login the users and at the same time it will reused the created test cases.
