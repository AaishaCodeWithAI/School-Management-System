/**
 * File: MainApp.java
 * Purpose: Entry point for the School Management System application.
 */
package School_Management_System.Main;

import javax.swing.SwingUtilities;
import School_Management_System.GUI.SchoolGUI;

/**
 * Main application launcher.
 */
public class MainApp {
    /**
     * Main method to start the GUI on the Event Dispatch Thread.
     * @param args command-line arguments
     */
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            SchoolGUI gui = new SchoolGUI();
            gui.showLogin();
        });
    }
}
