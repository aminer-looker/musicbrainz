view: link {
  sql_table_name: musicbrainz.link ;;

  dimension: id {
    primary_key: yes
    sql: ${TABLE}.id ;;
    type: number
  }

  dimension: begin {
    sql: ${TABLE}.begin_date_year || '' ;;
    type: string
  }

  dimension: end {
    sql: ${TABLE}.end_date_year || '' ;;
    type: string
  }

  dimension: link_type {
    sql: ${TABLE}.link_type ;;
    type: number
  }
}
