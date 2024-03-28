package com.hac.dto.foodDto;

import java.util.List;

import lombok.Data;
@Data
public class Body {

    public Integer pageNo;
    public Integer totalCount;
    public Integer numOfRows;
    public List<Item> items;

}
