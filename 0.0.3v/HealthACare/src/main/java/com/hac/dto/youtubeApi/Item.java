
package com.hac.dto.youtubeApi;

import lombok.Data;

@Data
public class Item {

    public String kind;
    public String etag;
    public Id id;
    public Snippet snippet;

}
