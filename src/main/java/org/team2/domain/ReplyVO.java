package org.team2.domain;

import lombok.Data;
import org.team2.domain.enums.PackageStatus;
import org.team2.domain.enums.PostStatus;
import org.team2.domain.enums.SatisStatus;

@Data
public class ReplyVO {
    //pk
    private Long reply_seq;

    //fk
    private Long user_seq;
    private Long product_seq;

    private PackageStatus reply_package;
    private PostStatus reply_post;
    private SatisStatus reply_satis;
}
