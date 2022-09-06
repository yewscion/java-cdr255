package cdr255.io;
import java.util.ArrayList;
import java.util.Scanner;

public class Input {
    public static String readRawInput(String prompt) {
        Scanner scanner = new Scanner(System.in);
        scanner.useDelimiter("\n");
        String rawInput;
        System.out.print(prompt);
        rawInput = scanner.next();
        scanner.close();
        return rawInput;
    }
    public static void main(String[] args) {
        System.out.println("Hello There!");
        System.out.println(readRawInput("Tell Me Something."));
    }
}

// Local Variables:
// mode: java
// End:
