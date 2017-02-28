view: album {
  sql_table_name: musicbrainz.release_group ;;

  # Dimensions ########################################################################

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  dimension: primary_type {
    sql: ${album_primary_type.name} ;;
  }

  # Measures ##########################################################################

  measure: count {
    type: count
    drill_fields: [name]
  }

  # Hidden Fields #####################################################################

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: primary_type_id {
    hidden: yes
    sql: ${TABLE}.type ;;
    type: number
  }

}
