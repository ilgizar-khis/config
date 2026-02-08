package dev.razigli.Server;

public class NoteAlreadyExistsException extends RuntimeException {
    public NoteAlreadyExistsException(String message) {
        super(message);
    }
}
