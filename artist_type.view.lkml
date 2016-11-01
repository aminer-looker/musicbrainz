view: artist_type {
  sql_table_name: musicbrainz.artist_type ;;

  dimension: id {
    primary_key: yes
    type:  number
    sql:  ${TABLE}.id ;;
  }

  dimension: description {
    type:  string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [ id, name ]
  }
}
