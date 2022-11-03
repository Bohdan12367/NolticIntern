@isTest
private class AnimalLocatorTest {
	
    @isTest
    static void animalLocatorTestAnim(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String actual = AnimalLocator.getAnimalNameById(1);
        String expected = 'moose';
        System.assertEquals(actual, expected);
    }
}