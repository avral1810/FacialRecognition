function result = createDatabase(faceDB)
    numOFea = 1;
    for i = 1:size(faceDB,2)
        for j = 1:faceDB(i).Count
            dbFeature(numOFea,:) = extractHOGFeatures(read(faceDB(i),j));
            dbLabel{numOFea} = faceDB(i).Description;
            numOFea = numOFea + 1;
        end
        personIndex{i} = faceDB(i).Description;
    end
    classifier = fitcecoc(dbFeature,dbLabel);
    result = classifier;
end