
package com.hac.dto.youtubeApi;

import java.util.List;

import lombok.Data;
@Data
public class YoutubeApiDto {

    public String kind;
    public String etag;
    public String nextPageToken;
    public String regionCode;
    public PageInfo pageInfo;
    public List<Item> items;

}
