import React from "react";
import "./Header.css";

export default function Header() {
  // Accessing the header title from the environment variables
  const headerTitle = process.env.REACT_APP_HEADER_TITLE;

  return (
    <header className="header">
      <h2 className="header--title">{headerTitle}</h2>
    </header>
  );
}
