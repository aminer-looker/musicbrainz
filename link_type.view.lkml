view: link_type {
  sql_table_name: musicbrainz.link_type ;;

  dimension: id {
    primary_key: yes
    sql: ${TABLE}.id ;;
    type: number
  }

  dimension: name {
    sql: ${TABLE}.name ;;
    type: string
  }
}
