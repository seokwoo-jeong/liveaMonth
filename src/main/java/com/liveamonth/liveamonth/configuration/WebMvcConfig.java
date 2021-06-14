package com.liveamonth.liveamonth.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import static com.liveamonth.liveamonth.constants.LogicConstants.EReviewImage.*;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(TEMP_IMAGE_PATH.getText()+"**")
                .addResourceLocations(REAL_IMAGE_PATH.getText());
    }
}