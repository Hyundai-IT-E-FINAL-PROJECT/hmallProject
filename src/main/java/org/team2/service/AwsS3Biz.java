package org.team2.service;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@AllArgsConstructor
@NoArgsConstructor
@Service
public class AwsS3Biz {

    @Setter(onMethod_ = @Autowired)
    private AmazonS3 s3Client;

    @Value("${aws.bucketname}")
    private String bucketName;

    public String uploadObject(MultipartFile multipartFile, String storedFileName) throws IOException {

        String filePath = "mainImage/" + storedFileName;
        // 1. bucket name, 2. key : full path to the file 3. file : new File로 생성한 file instance
        // 2. PutObjectRequest로 구현 가능
        s3Client.putObject(new PutObjectRequest(bucketName, filePath, multipartFile.getInputStream(), null));

        return s3Client.getUrl(bucketName, filePath).toString();
    }

    public void deleteObject( String storedFileName) throws AmazonServiceException {
        s3Client.deleteObject(new DeleteObjectRequest(bucketName + "/" , storedFileName));
    }

}
