package org.team2.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

@ToString
@Setter
@Getter
public class Criteria {

	private Long pageNum;
	private Long amount;

	public Criteria(Long pageNum, Long amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
