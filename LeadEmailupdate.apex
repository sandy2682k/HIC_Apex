trigger LeadEmailupdate on Lead (before update, after update) {
    if (Trigger.isBefore ) {
        for (Lead ld : Trigger.new) {
            if (trigger.newmap.get(ld.Id).email!=null && trigger.newmap.get(ld.id).email!=trigger.oldmap.get(ld.id).email) {
                ld.LastName = 'before update';
            }
        }
    }

    if (Trigger.isAfter) {
        List<Lead> leadList = new List<Lead>();
        for (Lead ld : Trigger.new) {
            if (trigger.newmap.get(ld.Id).email!=null && trigger.newmap.get(ld.id).email!=trigger.oldmap.get(ld.id).email) {
                Lead updateLead = new Lead(Id = ld.Id, LastName = 'after update');
                leadList.add(updateLead);
            }
        }
        if(!leadList.isEmpty())
            update leadList;
    }
}
