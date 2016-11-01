view: link {
  sql_table_name: musicbrainz.link ;;

  dimension: id {
    primary_key: yes
    sql: ${TABLE}.id ;;
    type: number
  }

  dimension_group: begin {
    type: time
    timeframes: [year]
    sql: to_date(${TABLE}.begin_date_year || '', 'YYYY') ;;
  }

  dimension_group: end {
    type: time
    timeframes: [year]
    sql: to_date(${TABLE}.end_date_year || '', 'YYYY') ;;
  }

  dimension: link_type {
    sql: ${TABLE}.link_type ;;
    type: number
  }
}
