view: users {
  sql_table_name: public.users ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    group_label: "User Demographics"
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    group_label: "User Location"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    group_label: "User Location"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
}
