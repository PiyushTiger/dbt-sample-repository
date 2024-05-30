# Simplifies retrieving XML elements
def get_xml_element(
        column:str,
        element:str,
        datatype:str,
        with_alias:bool = True
):
    new_element = (
        get(
            xmlget(
                col(column),
                lit(element),
            ),
            lit('$')
        )
        .cast(datatype)
    )

    # alias needs to be optional
    return (
        new_element.alias(element) if with_alias else new_element
    )

# Simplifies retrieving XML attributes
def get_xml_attribute(
        column:str,
        attribute:str,
        datatype:str,
        with_alias:bool = True
):
    new_attribute = (
        get(
            col(column),
            lit(f"@{attribute}")
        )
        .cast(datatype)
    )

    # alias needs to be optional
    return (
        new_attribute.alias(attribute) if with_alias else new_attribute
    )


def model(dbt, session):

    my_sql_model_df = dbt.source("test", "pra_xml")

    return my_sql_model_df
