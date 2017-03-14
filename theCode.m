function theCode()
    clc; clear all;
    choice = input('Is this your first time running the code? (1/0) : ');
    if(choice == 1)
    FirstRun(); 
    else
        while(1)
            choice = input('1. Test an image against database \n2. Add new person : ');
            if(choice == 1)
                Basicrun();
            else
                folder = uigetdir('Select the folder with images of the person');
                addPerson = imageSet(folder,'recursive');
                goBackDir = pwd;
                name = input('Enter the name of the person(UNIQUE) ','s');
                name = strcat('./DataBase/',name);
                mkdir(name);
                numOfFea = 1;
                for i = 1 : addPerson.Count
                    img = read(addPerson(1),i);
                    img = faceDetect(img);
                    cd(name);
                    fileName = strcat(num2str(i),'.pgm');
                    imwrite(img,fileName,'pgm');
                    cd(goBackDir);
                end
                FirstRun();
            end
            con = input('Press 0  to exit : ');
            if(con == 0)
                break;
            end
        end
    end
end