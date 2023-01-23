public class CreateRnwalOppHAndlerclass {
    public static void createRenewalOpportunities(List<Opportunity> newOpps) {
        List<Opportunity> renewalOpps = new List<Opportunity>();           
        for (Opportunity opp : newOpps) {                              
            if (opp.StageName == 'Closed won') {                        
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
}
