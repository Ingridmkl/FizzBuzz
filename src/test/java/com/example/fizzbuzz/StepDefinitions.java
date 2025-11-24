package com.example.fizzbuzz;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class StepDefinitions {

    private int number;
    private String result;

    @Given("the number {int}")
    public void the_number(Integer n) {
        this.number = n;
    }

    @When("the FizzBuzz rules are applied")
    public void the_fizzbuzz_rules_are_applied() {
        this.result = FizzBuzz.apply(this.number);
    }

    @Then("the result is \"{string}\"")
    public void the_result_is(String expected) {
        assertEquals(expected, this.result);
    }
}
