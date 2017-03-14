function result = faceDetect(Img)
    faceDetector = vision.CascadeObjectDetector;
    BB = step(faceDetector, Img);
    if(isempty(BB) == 1)
        result = Img;
    else
        detectedFace = insertObjectAnnotation(Img, 'rectangle', BB, ' '); 
        for i = 1 : size(BB,1)
            justFace = imcrop(detectedFace,BB(i,:));
        end
        Img = imresize(justFace,[112 92]);
        Img = rgb2gray(Img);
        result = Img;
    end
end