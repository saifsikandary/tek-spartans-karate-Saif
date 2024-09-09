package runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate runTest(){
        return Karate.run("/Users/saif/IdeaProjects/tek-spartans-karate-Saif/src/test/java/features/SecurityTest.feature");
    }
}
