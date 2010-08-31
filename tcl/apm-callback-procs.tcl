ad_library {
    Procedures for registering implementations for the
    dotLRN Messages package. 
    
    @creation-date 2010-01-20
    @author Pedro Castellanos (pedro@viaro.net)
}

namespace eval dotlrn_messages {}

ad_proc -public dotlrn_messages::install {} {
    dotLRN messages package install proc
} {
    register_portal_datasource_impl
}

ad_proc -public dotlrn_messages::uninstall {} {
    dotLRN messages package uninstall proc
} {
    unregister_portal_datasource_impl
}

ad_proc -public dotlrn_messages::register_portal_datasource_impl {} {
    Register the service contract implementation for the dotlrn_applet service contract
} {
    set spec {
        name "dotlrn_messages"
	contract_name "dotlrn_applet"
	owner "dotlrn-messages"
        aliases {
	    GetPrettyName dotlrn_messages::get_pretty_name
	    AddApplet dotlrn_messages::add_applet
	    RemoveApplet dotlrn_messages::remove_applet
	    AddAppletToCommunity dotlrn_messages::add_applet_to_community
	    RemoveAppletFromCommunity dotlrn_messages::remove_applet_from_community
	    AddUser dotlrn_messages::add_user
	    RemoveUser dotlrn_messages::remove_user
	    AddUserToCommunity dotlrn_messages::add_user_to_community
	    RemoveUserFromCommunity dotlrn_messages::remove_user_from_community
	    AddPortlet dotlrn_messages::add_portlet
	    RemovePortlet dotlrn_messages::remove_portlet
	    Clone dotlrn_messages::clone
	    ChangeEventHandler dotlrn_messages::change_event_handler
        }
    }
    
    acs_sc::impl::new_from_spec -spec $spec
}

ad_proc -public dotlrn_messages::unregister_portal_datasource_impl {} {
    Unregister service contract implementations
} {
    acs_sc::impl::delete \
        -contract_name "dotlrn_applet" \
        -impl_name "dotlrn_messages"
}

