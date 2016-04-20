module ApplicationHelper
  def user_has_a_mac?
    !request.env['HTTP_USER_AGENT'].downcase.match("os x").nil?
  end

  def facts
    [
      "The Komodo dragon is the largest living lizard.",
      "The largest verified Komodo dragon specimen reached a length of 10.3 feet (3.13 m) and weighed 366 pounds (166 kg).",
      "Komodo dragons can run at speeds up to 13 mph (20 kph).",
      "Komodo dragons can see objects as far away as 985 feet (300 m)",
      "The Komodo dragon detects odors much like a snake does. It uses its long, yellow forked tongue to sample the air.",
      "The Komodo dragon sense the existence and direction of odoriferous carrion from as far away as 2.5 miles (four km).",
      "In 2009, researchers concluded that the Komodo dragon has glands in its mouth that produce venom whose toxins cause the prey animal to go into shock and decrease its blood from clotting.",
      "Komodo dragons can throw up the contents of their stomachs when threatened to reduce their weight in order to flee.",
      "Because large Komodo dragons cannibalize young ones, the young often roll in fecal material, thereby assuming a scent that the large dragons avoid.",
      "The Komodo dragon's stomach expands easily, enabling an adult to consume up to 80 percent of its own body weight in a single meal.",
      "Komodo dragons are limited to a few volcanic Indonesian islands of the Lesser Sunda group including Komodo, the largest at 22 miles (35 km) long, Rintja, Padar, and Flores.",
      "Komodo dragons are estimated to live about 30 years in the wild.",
      "Komodo dragons are endangered due in part to the limited range of their habitat, consisting of only 4 islands in Indonesia.",
      "Komodo dragon females can reproduce without having sex.",
      "Komodo dragons are excellent swimmers.",
    ]
  end
end
