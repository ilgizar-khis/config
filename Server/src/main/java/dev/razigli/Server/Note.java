package dev.razigli.Server;

import java.nio.file.Path;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Note {
    @JsonFormat(pattern = "yyyy-MM-dd")
    private final LocalDate date;
    @JsonFormat(pattern = "HH:mm:ss")
    private final LocalTime time;
    private String text;
    private String name;

    public Note() {
        this.date = LocalDate.now();
        this.time = LocalTime.now();

    }

    public Note(String name, String text) {
        this.date = LocalDate.now();
        this.time = LocalTime.now();
        if (text == null) {
            throw new IllegalArgumentException("Text cannot be null");
        }
        if (name == null) {
            throw new IllegalArgumentException("Name cannot be null");
        }
        this.text = text;
        this.name = name;
    }

    public Note(String text) {
        this.date = LocalDate.now();
        this.time = LocalTime.now();
        if (text == null) {
            throw new IllegalArgumentException("Text cannot be null");
        }
        this.text = text;
        name = getDate() + " " + getTime() + ".json";
    }

    public void setText(String newText) {
        text = newText;
    }

    public String getText() {
        return text;
    }

    public void setName(String newName) {
        name = newName;
    }

    public String getName() {
        return name;
    }

    public String getDate() {
        return date.toString();
    }

    public String getTime() {
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern(
                "HH:mm:ss");
        return timeFormatter.format(time.withNano(0));

    }
}
