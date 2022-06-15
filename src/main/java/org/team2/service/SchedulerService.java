package org.team2.service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.team2.mapper.FundingMapper;

@Log4j
@Service
public class SchedulerService {

    @Setter(onMethod_ = @Autowired)
    private FundingMapper fundingMapper;

    @Scheduled(cron="0 0 0 * * *")
    public void scheduleRun() throws Exception {
          log.info("5sec");
          fundingMapper.updateFundStatusByDay();
    }
}
