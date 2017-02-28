view: packaging {
  sql_table_name: musicbrainz.release_packaging ;;

  # Dimensions ########################################################################

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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
}
