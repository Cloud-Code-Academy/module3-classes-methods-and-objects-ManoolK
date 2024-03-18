/**
 * The ClassesObjectsMethodsTest class is designed to test the functionality of the methods in the ClassesObjectsMethods class.
 * It houses a series of test methods, each tailored to validate the individual methods in the ClassesObjectsMethods class, ensuring their accuracy and correctness.
 * The Salesforce Assert class is widely used in these test methods to assert and validate the results.
 *
 * Test methods related to the Book and Person classes are currently commented out and will need to be uncommented and deployed once the classes are set up.
 * Users of this class can expect to gain an understanding of the basics of unit testing in Apex and Salesforce, and be equipped to write their own tests for custom code.
 */

@IsTest
public with sharing class ClassesObjectsMethodsTest {
    @IsTest
    static void testPracticeStringMethods() {
        // Call the practiceStringMethods method
        List<String> result = ClassesObjectsMethods.practiceStringMethods();

        // Expected results
        List<String> expected = new List<String>{'18', 'Hello', 'hello, salesforce!'};

        // Assert that the result is as expected
        Assert.areEqual(expected, result, 'Incorrect result for practiceStringMethods');
    }

    @IsTest
    static void testCheckStringContent() {
        String input1 = 'Salesforce is Awesome';
        List<Boolean> result1 = ClassesObjectsMethods.checkStringContent(input1);
        List<Boolean> expected1 = new List<Boolean>{true, false, true};
        Assert.areEqual(expected1, result1, 'Incorrect result for ' + input1);

        String input2 = 'SalesPower is Awesome Force';
        List<Boolean> result2 = ClassesObjectsMethods.checkStringContent(input2);
        List<Boolean> expected2 = new List<Boolean>{true, true, true};
        Assert.areEqual(expected2, result2, 'Incorrect result for ' + input2);

        String input3 = 'Something else';
        List<Boolean> result3 = ClassesObjectsMethods.checkStringContent(input3);
        List<Boolean> expected3 = new List<Boolean>{false, false, false};
        Assert.areEqual(expected3, result3, 'Incorrect result for ' + input3);
    }

    @IsTest
    static void testRemoveDuplicateWords() {
        // Test case 1
        String input1 = 'Salesforce is Salesforce';
        String result1 = ClassesObjectsMethods.removeDuplicateWords(input1);
        String expected1 = 'Salesforce is';
        Assert.areEqual(expected1, result1, 'Incorrect duplicate removal for ' + input1);

        // Test case 2
        String input2 = 'Salesforce Salesforce Salesforce';
        String result2 = ClassesObjectsMethods.removeDuplicateWords(input2);
        String expected2 = 'Salesforce';
        Assert.areEqual(expected2, result2, 'Incorrect duplicate removal for ' + input2);

        // Test case 3
        String input3 = 'Salesforce is Awesome';
        String result3 = ClassesObjectsMethods.removeDuplicateWords(input3);
        String expected3 = 'Salesforce is Awesome';
        Assert.areEqual(expected3, result3, 'Incorrect duplicate removal for ' + input3);
    }

    @IsTest
    static void testCountVowels() {
        Integer result = ClassesObjectsMethods.countVowels('Hello World!');
        Assert.areEqual(3, result, 'Incorrect vowel count for "Hello World!"');
        
        result = ClassesObjectsMethods.countVowels('Supra');
        Assert.areEqual(2, result, 'Incorrect vowel count for "Supra"');
        
        result = ClassesObjectsMethods.countVowels('The quick brown fox jumps over the lazy dog');
        Assert.areEqual(11, result, 'Incorrect vowel count for "The quick brown fox jumps over the lazy dog"');
    }

    @IsTest
    static void testFindTheScientist() {
        String result = ClassesObjectsMethods.findTheScientist();
        Assert.areEqual('Alan Turing,Grace Hopper,Guido van Rossum,Stephen Hawking', result, 'Incorrect concatenated string');

    }

    @IsTest
    static void testCalculateDifferenceOfSquares() {
        // Test case 1
        Double a1 = 4.0;
        Double b1 = 3.0;
        Double result1 = ClassesObjectsMethods.calculateDifferenceOfSquares(a1, b1);
        Double expected1 = 7.0;
        Assert.areEqual(expected1, result1, 'Test Case 1: Expected the difference of squares between ' + a1 + ' and ' + b1 + ' to be ' + expected1 + ', but received ' + result1);
    
        // Test case 2
        Double a2 = 5.0;
        Double b2 = 2.0;
        Double result2 = ClassesObjectsMethods.calculateDifferenceOfSquares(a2, b2);
        Double expected2 = 21.0;
        Assert.areEqual(expected2, result2, 'Test Case 2: Expected the difference of squares between ' + a2 + ' and ' + b2 + ' to be ' + expected2 + ', but received ' + result2);
    
        // Test case 3
        Double a3 = 7.0;
        Double b3 = 1.0;
        Double result3 = ClassesObjectsMethods.calculateDifferenceOfSquares(a3, b3);
        Double expected3 = 48.0;
        Assert.areEqual(expected3, result3, 'Test Case 3: Expected the difference of squares between ' + a3 + ' and ' + b3 + ' to be ' + expected3 + ', but received ' + result3);
    }

    @IsTest
    static void testGenerateRandomNumber() {
        // Generate a random number
        Integer randomNumber = ClassesObjectsMethods.generateRandomNumber();

        // Assert that the random number is within the expected range (50 - 100)
        Boolean isWithinRange = randomNumber >= 50 && randomNumber <= 100;
        Assert.isTrue(isWithinRange, 'The generated random number ' + randomNumber + ' is not within the expected range (50 - 100)');

        // Also check the type of the result to ensure it's an Integer
        Assert.isInstanceOfType(randomNumber, Integer.class, 'The returned value is not of expected type Integer');
    }

    
    @IsTest
    static void testGetCurrentDate() {
        // Get the current date using the method
        String result = ClassesObjectsMethods.getCurrentDate();
    
        // Assert that the result is not null
        Assert.isNotNull(result, 'The returned date string is null');
        
        // Assert that the returned date is equal to the expected date
        Assert.areEqual(Date.today().format(), result, 'The returned date string ' + result + ' does not match the current date ' + Date.today().format());
    }

    @IsTest
    static void testGetDayOfWeek() {
        // Get today's date
        DateTime now = DateTime.now();
        
        // Use the method to get the day of the week
        String dayOfWeek = ClassesObjectsMethods.getDayOfWeek(now);

        // Assert that the result is not null
        Assert.isNotNull(dayOfWeek, 'Returned day of the week is null');

        Map<String, String> dayNumberToDayString = new Map<String, String>{
            '1' => 'Monday',
            '2' => 'Tuesday',
            '3' => 'Wednesday',
            '4' => 'Thursday',
            '5' => 'Friday',
            '6' => 'Saturday',
            '7' => 'Sunday'
        };

        // Assert that the returned day number is a valid day of the week
        Assert.isTrue(dayNumberToDayString.keySet().contains(dayOfWeek), 'Returned day of the week ' + dayOfWeek + ' is not valid');
        Assert.areEqual(Datetime.now().format('EEEE'), dayNumberToDayString.get(dayOfWeek), 'Returned day of the week ' + dayOfWeek + ' does not match the expected day of the week ' + Datetime.now().format('EEEE'));
    }

    @IsTest
    static void testCalculateYearDifference() {
        // Define some dates
        Date date1 = Date.newInstance(2023, 1, 1);
        Date date2 = Date.newInstance(2025, 12, 31);
        Date date3 = Date.newInstance(2023, 12, 31);
        Date date4 = Date.newInstance(2024, 1, 1);

        // Test with non-null dates
        Integer result = ClassesObjectsMethods.calculateYearDifference(date1, date2);
        Assert.areEqual(2, result, 'Incorrect year difference for dates 2023-01-01 and 2025-12-31');

        // Test with same year, different days
        result = ClassesObjectsMethods.calculateYearDifference(date1, date3);
        Assert.areEqual(0, result, 'Incorrect year difference for dates in the same year');

        // Test with next day in the next year
        result = ClassesObjectsMethods.calculateYearDifference(date3, date4);
        Assert.areEqual(1, result, 'Incorrect year difference for dates one day apart in different years');

        // Test with null dates
        result = ClassesObjectsMethods.calculateYearDifference(null, date2);
        Assert.isNull(result, 'Year difference should be null if one date is null');
        result = ClassesObjectsMethods.calculateYearDifference(date1, null);
        Assert.isNull(result, 'Year difference should be null if one date is null');
        result = ClassesObjectsMethods.calculateYearDifference(null, null);
        Assert.isNull(result, 'Year difference should be null if both dates are null');
    }

    /* //UNCOMMENT TEST METHODS BELOW ONCE THE BOOK AND PERSON CLASSES ARE SET UP
    @IsTest
    static void testBookClass() {
        // Initialize a new book instance
        ClassesObjectsMethods.Book myBook = new ClassesObjectsMethods.Book('1984', 'George Orwell');

        // Check that the title and author were set correctly
        Assert.areEqual('1984', myBook.title, 'The title should be correctly set');
        Assert.areEqual('George Orwell', myBook.author, 'The author should be correctly set');

        // Call the getBookDetails method and verify the result
        String bookDetails = myBook.getBookDetails();
        Assert.areEqual('Title: 1984, Author: George Orwell', bookDetails, 'The book details should be correctly formatted');
    }
    */

    @IsTest
    static void testCreateAndGetBookDetails() {
        // Call the createAndGetBookDetails method and capture the return value
        String result = ClassesObjectsMethods.createAndGetBookDetails();

        // Define the expected result
        String expectedResult = 'Title: A Brief History of Time, Author: Stephen Hawking';

        // Use the Assert class to check that the result matches the expected result
        Assert.areEqual(expectedResult, result, 'The method should return the correct book details');
    }

    /* //UNCOMMENT TEST METHODS BELOW ONCE THE BOOK AND PERSON CLASSES ARE SET UP
    @IsTest
    static void testGenerateBookList() {
        // Create a Book instance
        ClassesObjectsMethods.Book myTestBook = new ClassesObjectsMethods.Book('Test Title', 'Test Author');
        
        // Call the generateBookList method and capture the return value
        List<ClassesObjectsMethods.Book> result = ClassesObjectsMethods.generateBookList(myTestBook);

        // Define the expected result
        List<ClassesObjectsMethods.Book> expectedResult = new List<ClassesObjectsMethods.Book>{
            new ClassesObjectsMethods.Book('Harry Potter and the Chamber of Secrets', 'J.K. Rowling'),
            new ClassesObjectsMethods.Book('A Brief History of Time', 'Stephen Hawking')
        };

        // Use the Assert class to check that the result matches the expected result
        Assert.areEqual(expectedResult.size(), result.size(), 'The method should return two books');

        for (Integer i = 0; i < result.size(); i++) {
            Assert.areEqual(expectedResult[i].title, result[i].title, 'Title of book at index ' + i + ' should match');
            Assert.areEqual(expectedResult[i].author, result[i].author, 'Author of book at index ' + i + ' should match');
        }

        Assert.areEqual(352, result[0].pages, 'Pages of book at index 0 should match');
        Assert.areEqual(256, result[1].pages, 'Pages of book at index 1 should match');
    }
    */

    /* //UNCOMMENT TEST METHODS BELOW ONCE THE BOOK AND PERSON CLASSES ARE SET UP
    @IsTest
    static void testPersonClass() {
        // Initialize a new Person instance
        ClassesObjectsMethods.Person testPerson = new ClassesObjectsMethods.Person('John Doe', 25);

        // Check that the name and age were set correctly
        Assert.areEqual('John Doe', testPerson.getName(), 'The name should be correctly set');
        Assert.areEqual(25, testPerson.getAge(), 'The age should be correctly set');

        // Call the introduceYourself method and verify the result
        String intro = testPerson.introduceYourself();
        Assert.areEqual('Hello, my name is John Doe and I am 25 years old.', intro, 'The introduction should be correctly formatted');

        // Test the setter methods
        testPerson.setName('Jane Doe');
        testPerson.setAge(30);

        // Verify that the name and age have been updated correctly
        Assert.areEqual('Jane Doe', testPerson.getName(), 'The name should be correctly updated');
        Assert.areEqual(30, testPerson.getAge(), 'The age should be correctly updated');

        // Call the introduceYourself method again and verify the result
        intro = testPerson.introduceYourself();
        Assert.areEqual('Hello, my name is Jane Doe and I am 30 years old.', intro, 'The updated introduction should be correctly formatted');
    }
    */

    @IsTest
    static void testPersonDetails() {
        // Call the personDetails method and capture the return value
        List<String> resultDetails = ClassesObjectsMethods.personDetails();

        // Check that the returned List has 3 elements
        Assert.areEqual(3, resultDetails.size(), 'The returned List should contain 3 elements');

        // Define the expected values for comparison
        String expectedIntro = 'Hello, my name is John Doe and I am 28 years old.';
        String expectedName = 'John Doe';
        String expectedAge = '28';

        // Check that the first element in the returned List is the expected introduction
        Assert.areEqual(expectedIntro, resultDetails.get(0), 'The first element should be the expected introduction');

        // Check that the second element in the returned List is the expected name
        Assert.areEqual(expectedName, resultDetails.get(1), 'The second element should be the expected name');

        // Check that the third element in the returned List is the expected age
        Assert.areEqual(expectedAge, resultDetails.get(2), 'The third element should be the expected age');
    }

    /* UNCOMMENT TEST METHODS BELOW ONCE THE BOOK AND PERSON CLASSES ARE SET UP
    @IsTest
    static void testCreatePerson() {
        // Define the name and age to use for testing
        String testName = 'Test Name';
        Integer testAge = 30;
        
        // Call the createPerson method and capture the return value
        ClassesObjectsMethods.Person resultPerson = ClassesObjectsMethods.createPerson(testName, testAge);

        // Use the Assert class to check that the result person's name and age matches the test name and age
        Assert.areEqual(testName, resultPerson.getName(), 'The person\'s name should match the test name');
        Assert.areEqual(testAge, resultPerson.getAge(), 'The person\'s age should match the test age');
    }
    */

    /* UNCOMMENT TEST METHODS BELOW ONCE THE BOOK AND PERSON CLASSES ARE SET UP
    @IsTest
    static void testCreateMultiplePersons() {
        // Define a list of names and an age for testing
        List<String> testNames = new List<String>{'Test Name 1', 'Test Name 2', 'Test Name 3'};
        Integer testAge = 30;
        
        // Call the createMultiplePersons method and capture the return value
        List<ClassesObjectsMethods.Person> resultPersons = ClassesObjectsMethods.createMultiplePersons(testNames, testAge);

        // Check that the number of persons returned matches the number of test names
        Assert.areEqual(testNames.size(), resultPersons.size(), 'The number of persons should match the number of test names');

        // Loop through each name in the test names
        for (Integer i = 0; i < testNames.size(); i++) {
            // Check that each person's name and age matches the test name and age
            Assert.areEqual(testNames[i], resultPersons[i].getName(), 'The person\'s name should match the test name');
            Assert.areEqual(testAge, resultPersons[i].getAge(), 'The person\'s age should match the test age');
        }
    }
    */

    /* UNCOMMENT TEST METHODS BELOW ONCE THE BOOK AND PERSON CLASSES ARE SET UP
    @IsTest
    static void testGetOlderPerson() {
        // Create two Person objects with different ages
        ClassesObjectsMethods.Person person1 = new ClassesObjectsMethods.Person('Person1', 25);
        ClassesObjectsMethods.Person person2 = new ClassesObjectsMethods.Person('Person2', 30);

        // Call the getOlderPerson method and capture the return value
        ClassesObjectsMethods.Person resultPerson = ClassesObjectsMethods.getOlderPerson(person1, person2);

        // Check that the returned Person object is the one with the greater age
        Assert.areEqual(person2, resultPerson, 'The returned Person should be the one with the greater age');

        // Swap the ages and retest
        person1.setAge(35);
        person2.setAge(30);

        // Call the getOlderPerson method and capture the return value
        resultPerson = ClassesObjectsMethods.getOlderPerson(person1, person2);

        // Check that the returned Person object is the one with the greater age
        Assert.areEqual(person1, resultPerson, 'The returned Person should be the one with the greater age');

        // Set both ages to be equal and retest
        person1.setAge(40);
        person2.setAge(40);

        // Call the getOlderPerson method and capture the return value
        resultPerson = ClassesObjectsMethods.getOlderPerson(person1, person2);

        // Check that the returned Person object is one of the two Persons
        Assert.isTrue(resultPerson == person1 || resultPerson == person2, 'The returned Person should be one of the two Persons');
    }
    */
}