include: "/chris_drake_tim_mock_codevs/users.view.lkml"

view: users_extended_view {
  extends: [users]

  measure: median_age {
    type: median
    sql: ${age} ;;
  }

  measure: avg_age {
    type: average
    sql: ${age} ;;
  }

#   parameter: metric_selector {
#     allowed_value: {
#       label: "Youngest Age"
#       value: "youngest"
#     }
#     allowed_value: {
#       label: "Oldest Age"
#       value: "oldest"
#     }
#   }
#
#   measure: metric {
#     type: number
#     sql: CASE
#             WHEN {% parameter users.metric_selector %} = 'oldest' THEN MAX(${age})
#             WHEN {% parameter users.metric_selector %} = 'youngest' THEN MIN(${age})
#           END ;;
#   }

  parameter: metric_selector {
    type: unquoted
    allowed_value: {
      label: "Youngest Age"
      value: "MIN"
    }
    allowed_value: {
      label: "Oldest Age"
      value: "MAX"
    }
  }

  measure: metric {
    type: number
    sql:
      {% parameter metric_selector %}(${age})
      ;;
  }
}
