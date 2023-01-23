trigger CreateRenewalOpportunity on Opportunity (after insert ) {
    List<Opportunity> renewalOpps = new List<Opportunity>();   
    for (Opportunity opp : Trigger.new) {                  
        if (opp.Stagename == 'Closed won') {         
            Opportunity renewalOpp = opp.clone();      
            renewalOpp.Name = opp.Name + ' - Renewal';
            renewalOpp.CloseDate = renewalOpp.CloseDate.addDays(30);
            renewalOpp.StageName = 'Renewal';
            renewalOpps.add(renewalOpp);
        }
    }
    if(!renewalOpps.isEmpty()) {
          insert renewalOpps; 
    }
}
