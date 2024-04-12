package com.hac.dto.foodDto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class CalorieLogDto {
    @JsonProperty("C_no") 
    public int C_no;
    @JsonProperty("C_calorie") 
    public double C_calorie;
    @JsonProperty("C_foodName") 
    public String C_foodName;
    @JsonProperty("C_servingAmount") 
    public int C_servingAmount;
}