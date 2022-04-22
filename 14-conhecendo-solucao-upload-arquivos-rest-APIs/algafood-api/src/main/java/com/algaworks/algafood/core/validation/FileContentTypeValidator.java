package com.algaworks.algafood.core.validation;

import org.springframework.http.MediaType;
import org.springframework.util.unit.DataSize;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.Arrays;
import java.util.Objects;

public class FileContentTypeValidator implements ConstraintValidator<FileContentType, MultipartFile> {

    private String[] mediaType;

    @Override
    public void initialize(FileContentType constraintAnnotation) {
        this.mediaType = constraintAnnotation.allowed();
    }

    @Override
    public boolean isValid(MultipartFile value, ConstraintValidatorContext context) {
        return Arrays.stream(mediaType).anyMatch(media -> Objects.equals(value.getContentType(), media));
    }
}
