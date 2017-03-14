function Basicrun()
    [file, path] = uigetfile('.pgm','Choose a file to search');
    file = strcat(path,file);
    Img = imread(file);
    load Database
    Img = faceDetect(Img);
    testFeature = extractHOGFeatures(Img);
    whatPerson  = predict(classifier, testFeature);
    msgbox(strcat('Person in Image is : ',whatPerson));
    display(strcat('Person in Image is : ',whatPerson));
    faceDB = imageSet('./Database','recursive');
    for i = 1:size(faceDB,2)
        if(strcmp(faceDB(i).Description,whatPerson)==1)
            for j = 1:3
                imgg = read(faceDB(i),j);
                subplot(3,1,j);
                imshow(imgg);
            end
        end
    end
end