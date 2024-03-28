package com.hac.dto.n_BbsDto;

import lombok.Data;

@Data
public class N_BbsLimitDto {
	 int limitIndex=0;
     int PAGE_LINK_AMOUNT = 4;
     int BLOCK_LINK_AMOUNT = 3;

//    public int getPAGE_LINK_AMOUNT() {
//        return PAGE_LINK_AMOUNT;
//    }
//
//    public int getBLOCK_LINK_AMOUNT() {
//        return BLOCK_LINK_AMOUNT;
//    }
}
