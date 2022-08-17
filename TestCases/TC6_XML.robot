*** Settings ***
Library    XML
Library    os
Library    Collections

*** Test Cases ***
TestCase1
    ${xml_obj}=     parse xml    TestData/employees.xml

    # Validations
    # Val1 - Check the single element value
    # Approach 1
    ${emp_firstname}=     get element text    ${xml_obj}    .//employee[1]/firstname
    should be equal    ${emp_firstname}     John

    # Approach 2
    ${emp_firstname}=     get element    ${xml_obj}    .//employee[1]/firstname
    should be equal    ${emp_firstname.text}     John

    # Approach 3
    element text should be    ${xml_obj}    John    .//employee[1]/firstname

    # Val2 - Check number of elements
    ${emp_count}=   get element count    ${xml_obj}     .//employee
    should be equal as integers    ${emp_count}     4

    # Val3 - Check attribute presence
    element attribute should be    ${xml_obj}   id  be129   .//employee[1]
    element attribute should be    ${xml_obj}   id  be132   .//employee[4]

    # Val4 - Check values of child elements
    ${child_elements}=   get child elements    ${xml_obj}    .//employee[1]
    should not be empty    ${child_elements}

    ${fname}=  get element text    ${child_elements[0]}
    ${lname}=  get element text    ${child_elements[1]}
    ${title}=  get element text    ${child_elements[2]}

    log to console    ${fname}
    log to console    ${lname}
    log to console    ${title}

    should be equal    ${fname}     John
    should be equal    ${lname}     Doe
    should be equal    ${title}     Engineer