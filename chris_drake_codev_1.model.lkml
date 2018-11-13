connection: "thelook_events_redshift"

# include all the views
include: "*.view"

datagroup: chris_drake_codev_1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: chris_drake_codev_1_default_datagroup

explore: order_items {
  label: "orders"
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: one_to_one
  }
  join: distribution_centers {
    type: left_outer
    sql_on: ${inventory_items.product_distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}


#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${order_items.user_id} = ${users.id}
#       relationship: many_to_one

#     - join: inventory_items
#       type: left_outer
#       sql_on: ${order_items.inventory_item_id} = ${inventory_items.id}
#       relationship: many_to_one

#     - join: products
#       type: left_outer
#       sql_on: ${inventory_items.product_id} = ${products.id}
#       relationship: many_to_one

#     - join: distribution_centers
#       type: left_outer
#       sql_on: ${products.distribution_center_id} = ${distribution_centers.id}
#       relationship: many_to_one


# - explore: bsandell

# - explore: company_list

# - explore: distribution_centers

# - explore: events
#   joins:
#     - join: users
#       type: left_outer
#       sql_on: ${events.user_id} = ${users.id}
#       relationship: many_to_one


# - explore: inventory_items
#   joins:
#     - join: products
#       type: left_outer
#       sql_on: ${inventory_items.product_id} = ${products.id}
#       relationship: many_to_one

#     - join: distribution_centers
#       type: left_outer
#       sql_on: ${products.distribution_center_id} = ${distribution_centers.id}
#       relationship: many_to_one


# - explore: products
#   joins:
#     - join: distribution_centers
#       type: left_outer
#       sql_on: ${products.distribution_center_id} = ${distribution_centers.id}
#       relationship: many_to_one


# - explore: users
