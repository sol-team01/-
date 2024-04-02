
package com.hac.dto.youtubeApi;

import lombok.Data;

@Data
public class Snippet {

    public String publishedAt;
    public String channelId;
    public String title;
    public String description;
    public Thumbnails thumbnails;
    public String channelTitle;
    public String liveBroadcastContent;
    public String publishTime;

}
