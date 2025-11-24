package com.example.fizzbuzz;

import org.junit.runner.RunWith;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(
    plugin = {"pretty"},
    features = "classpath:features",
    glue = "com.example.fizzbuzz"
)
public class RunCucumberJunit4Test {
}
