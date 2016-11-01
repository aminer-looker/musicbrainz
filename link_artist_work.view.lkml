view: link_artist_work {
  sql_table_name: musicbrainz.l_artist_work ;;

  dimension: id {
    primary_key: yes
    sql: ${TABLE}.id ;;
    type: number
  }

  dimension: artist_id {
    sql: ${TABLE}.entity0 ;;
    type: number
  }

  dimension: details_id {
    sql: ${TABLE}.link ;;
    type: number
  }

  dimension: work_id {
    sql: ${TABLE}.entity1 ;;
    type: number
  }
}
