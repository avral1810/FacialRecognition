function FirstRun()
    clear all
    clc
    folder = './DataBase';
    faceDB = imageSet(folder,'recursive');
    classifier = createDatabase(faceDB);
    save Database.mat classifier
end