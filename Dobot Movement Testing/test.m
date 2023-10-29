% Initialize the simulated Dobot Magician
robot = DobotMagician();

% Define a list of joint configurations (poses) to move to
poses = [
    0, pi/4, pi/4, pi/2, 0; % start pose
    0, pi/6, pi/4, pi/2, 0;

    pi/4, pi/4, pi/4, pi/2, 0;
    pi/4, pi/6, pi/4, pi/2, 0;

    pi/6, pi/4, pi/4, pi/2, 0;
    pi/6, pi/6, pi/4, pi/2, 0;

    pi/8, pi/4, pi/4, pi/2, 0;
    pi/8, pi/6, pi/4, pi/2, 0;

    -pi/4, pi/4, pi/4, pi/2, 0;
    -pi/4, pi/6, pi/4, pi/2, 0;

    -pi/6, pi/4, pi/4, pi/2, 0;
    -pi/6, pi/6, pi/4, pi/2, 0;

    -pi/8, pi/4, pi/4, pi/2, 0;
    -pi/8, pi/6, pi/4, pi/2, 0;
];

% Loop through each pose
for i = 1:size(poses, 1)
    % Get the current pose
    currentPose = poses(i, :);

    % Move the robot to the current pose
    robot.model.animate(currentPose);

    % Pause to observe the transformation
    pause(2); % You can adjust the pause duration as needed

    % Display the transformation matrix of the end effector
    disp(['Transformation Matrix for Pose ', num2str(i), ':']);
    disp(robot.model.fkine(currentPose).T);
end
