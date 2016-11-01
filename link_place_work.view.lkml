view: link_place_work {
  sql_table_name: musicbrainz.l_place_work ;;

  dimension: id {
    primary_key: yes
    sql: ${TABLE}.id ;;
    type: number
  }

  dimension: detail_id {
    sql: ${TABLE}.link ;;
    type: number
  }

  dimension: place_id {
    sql: ${TABLE}.entity0 ;;
    type: number
  }

  dimension: work_id {
    sql: ${TABLE}.entity1 ;;
  }
}
