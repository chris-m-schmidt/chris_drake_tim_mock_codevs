connection: "thelook_events_redshift"

# include: "/acme_base_model.model.lkml"
# include: "/acme_base_project/*.view.lkml"
include: "*.view.lkml"

explore: users {
  from: users_extended_view
  access_filter: {
    field: users.country
    user_attribute: user_country
  }
}
