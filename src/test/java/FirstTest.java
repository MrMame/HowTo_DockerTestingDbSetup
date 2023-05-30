import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class FirstTest {

    @BeforeEach
    void setup() {
        // setup tasks like populating sample data
    }

    @AfterEach
    void tearDown() {
        // cleanup tasks like deleting database rows
    }

    @Test
    void testOne() {
        assertNotNull("NOT NULL");
        assertNotEquals("John", "Duke");
        assertThrows(NumberFormatException.class, () -> Integer.valueOf("duke"));
        assertEquals("hello world", "HELLO WORLD".toLowerCase());
    }

}