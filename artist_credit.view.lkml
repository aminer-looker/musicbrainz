view: artist_credit {
  sql_table_name: musicbrainz.artist_credit ;;

  # Dimensions ########################################################################

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  # Hidden Fields #####################################################################

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
}
