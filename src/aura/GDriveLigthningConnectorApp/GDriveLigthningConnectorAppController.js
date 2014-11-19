({
	doInit : function(component, event, helper) {
        
        var action = component.get("c.loadContact");
        action.setParams({objId : component.get("v.id")});
        var self = this;
        action.setCallback(this, function(a) {
            console.log(a);
            var contact = JSON.parse(a.getReturnValue())[0];
            component.set("v.cnt", contact);
            console.log(component.get("v.cnt"));
        });
        $A.enqueueAction(action);
        
	}
})