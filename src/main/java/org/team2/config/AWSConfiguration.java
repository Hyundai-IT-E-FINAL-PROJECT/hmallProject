package org.team2.config;


import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import lombok.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class AWSConfiguration implements WebMvcConfigurer {


    private String accessKey ="AKIATNAAHJTEVJV6FGQF";

//    @Value("${ge1R0qp2Dy5L46bbxYblVAENtPkyd0PzZ9PfVYZ8}")
    private String secretKey="ge1R0qp2Dy5L46bbxYblVAENtPkyd0PzZ9PfVYZ8";

    @Bean
    public BasicAWSCredentials AwsCredentials() {
        BasicAWSCredentials AwsCreds = new BasicAWSCredentials(accessKey, secretKey);
        return AwsCreds;
    }

    @Bean
    public AmazonS3 AwsS3Client() {

        AmazonS3 s3Builder = AmazonS3ClientBuilder.standard()
                .withRegion(Regions.AP_NORTHEAST_2)
                .withCredentials(new AWSStaticCredentialsProvider(this.AwsCredentials()))
                .build();

        return s3Builder;
    }
}